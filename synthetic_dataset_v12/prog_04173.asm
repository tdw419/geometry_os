; DESCRIPTION: Places a orange 59x90 rectangle at position (256, 150).
; PLAN: r0=256(x), r1=150(y), r2=59(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 150
LDI r2, 59
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

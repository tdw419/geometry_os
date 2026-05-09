; DESCRIPTION: Places a white 35x90 rectangle at position (35, 50).
; PLAN: r0=35(x), r1=50(y), r2=35(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 50
LDI r2, 35
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a orange 103x29 rectangle at position (210, 215).
; PLAN: r0=210(x), r1=215(y), r2=103(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 215
LDI r2, 103
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

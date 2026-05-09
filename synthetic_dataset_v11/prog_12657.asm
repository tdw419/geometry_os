; DESCRIPTION: Places a orange 33x70 rectangle at position (202, 144).
; PLAN: r0=202(x), r1=144(y), r2=33(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 144
LDI r2, 33
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

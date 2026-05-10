; DESCRIPTION: Renders a white box of size 55x16 starting at (217, 160).
; PLAN: r0=217(x), r1=160(y), r2=55(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 160
LDI r2, 55
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

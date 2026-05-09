; DESCRIPTION: Renders a white box of size 107x16 starting at (329, 98).
; PLAN: r0=329(x), r1=98(y), r2=107(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 98
LDI r2, 107
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

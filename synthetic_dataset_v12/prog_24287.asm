; DESCRIPTION: Renders a white box of size 48x26 starting at (296, 202).
; PLAN: r0=296(x), r1=202(y), r2=48(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 202
LDI r2, 48
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a white box of size 111x74 starting at (363, 21).
; PLAN: r0=363(x), r1=21(y), r2=111(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 21
LDI r2, 111
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

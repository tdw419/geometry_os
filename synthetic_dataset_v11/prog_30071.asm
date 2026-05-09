; DESCRIPTION: Composite: . Then Renders a cyan disk with center (195, 60) and radius 27. Then Draws a black line from (202, 109) to (67, 144).
; PLAN: r0=195(x), r1=60(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=202(x1), r1=109(y1), r2=67(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (195, 60) and radius 27.
; PLAN: r0=195(x), r1=60(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 60
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black line from (202, 109) to (67, 144).
; PLAN: r0=202(x1), r1=109(y1), r2=67(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 109
LDI r2, 67
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

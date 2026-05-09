; DESCRIPTION: Composite: . Then Renders a black disk with center (121, 128) and radius 27. Then Draws a yellow line from (164, 107) to (23, 182).
; PLAN: r0=121(x), r1=128(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=164(x1), r1=107(y1), r2=23(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (121, 128) and radius 27.
; PLAN: r0=121(x), r1=128(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 128
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a yellow line from (164, 107) to (23, 182).
; PLAN: r0=164(x1), r1=107(y1), r2=23(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 107
LDI r2, 23
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

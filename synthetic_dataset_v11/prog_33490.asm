; DESCRIPTION: Composite: . Then Renders a magenta line between points (49, 52) and (113, 97). Then Renders a purple disk with center (115, 128) and radius 42.
; PLAN: r0=49(x1), r1=52(y1), r2=113(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=115(x), r1=128(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta line between points (49, 52) and (113, 97).
; PLAN: r0=49(x1), r1=52(y1), r2=113(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 52
LDI r2, 113
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (115, 128) and radius 42.
; PLAN: r0=115(x), r1=128(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 128
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT

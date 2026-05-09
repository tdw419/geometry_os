; DESCRIPTION: Composite: Places a green line segment connecting (42, 215) to (259, 34) then Places a magenta circle of radius 73 at center (394, 137).
; PLAN: r0=42(x1), r1=215(y1), r2=259(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=394(x), r6=137(y), r7=73(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 42
LDI r1, 215
LDI r2, 259
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 137
LDI r7, 73
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT

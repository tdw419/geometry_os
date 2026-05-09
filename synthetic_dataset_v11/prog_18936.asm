; DESCRIPTION: Composite: . Then Draws a cyan line from (242, 253) to (2, 233). Then Creates a cyan circular shape at (143, 76) with radius 62.
; PLAN: r0=242(x1), r1=253(y1), r2=2(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=143(x), r1=76(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan line from (242, 253) to (2, 233).
; PLAN: r0=242(x1), r1=253(y1), r2=2(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 253
LDI r2, 2
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan circular shape at (143, 76) with radius 62.
; PLAN: r0=143(x), r1=76(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 76
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

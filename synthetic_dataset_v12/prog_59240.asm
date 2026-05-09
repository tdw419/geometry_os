; DESCRIPTION: Composite: Draws a cyan line from (345, 236) to (373, 204) then Places a cyan circle of radius 43 at center (135, 159).
; PLAN: r0=345(x1), r1=236(y1), r2=373(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=135(x), r6=159(y), r7=43(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 345
LDI r1, 236
LDI r2, 373
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 159
LDI r7, 43
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT

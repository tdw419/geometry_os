; DESCRIPTION: Composite: Renders a green disk with center (401, 64) and radius 30 then Draws a red line from (263, 149) to (464, 221).
; PLAN: r0=401(x), r1=64(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=263(x1), r6=149(y1), r7=464(x2), r8=221(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 401
LDI r1, 64
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 263
LDI r6, 149
LDI r7, 464
LDI r8, 221
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT

; DESCRIPTION: Composite: Renders a red disk with center (267, 213) and radius 38 then Renders a cyan line between points (327, 226) and (383, 221).
; PLAN: r0=267(x), r1=213(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=327(x1), r6=226(y1), r7=383(x2), r8=221(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 267
LDI r1, 213
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 327
LDI r6, 226
LDI r7, 383
LDI r8, 221
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT

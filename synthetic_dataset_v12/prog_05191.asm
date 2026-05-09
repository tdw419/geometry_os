; DESCRIPTION: Composite: Renders a yellow disk with center (401, 68) and radius 55 then Draws a cyan line from (193, 249) to (465, 192).
; PLAN: r0=401(x), r1=68(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=193(x1), r6=249(y1), r7=465(x2), r8=192(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 401
LDI r1, 68
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 193
LDI r6, 249
LDI r7, 465
LDI r8, 192
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT

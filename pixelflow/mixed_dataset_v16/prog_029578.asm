; DESCRIPTION: Composite: Renders a yellow line between points (361, 243) and (305, 245) then Sets a single magenta pixel at (271, 208) then Renders a purple box of size 120x22 starting at (249, 226).
; PLAN: r0=361(x1), r1=243(y1), r2=305(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=208(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=249(x), r11=226(y), r12=120(width), r13=22(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 361
LDI r1, 243
LDI r2, 305
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 208
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 249
LDI r11, 226
LDI r12, 120
LDI r13, 22
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT

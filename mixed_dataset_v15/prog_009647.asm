; DESCRIPTION: Composite: Places a cyan dot at position (213, 168) then Renders a magenta line between points (125, 67) and (389, 125) then Renders a yellow box of size 15x19 starting at (124, 218).
; PLAN: r0=213(x), r1=168(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=125(x1), r6=67(y1), r7=389(x2), r8=125(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=124(x), r11=218(y), r12=15(width), r13=19(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 213
LDI r1, 168
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 125
LDI r6, 67
LDI r7, 389
LDI r8, 125
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 124
LDI r11, 218
LDI r12, 15
LDI r13, 19
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT

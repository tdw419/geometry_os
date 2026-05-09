; DESCRIPTION: Composite: Places a green dot at position (313, 139) then Draws a black line from (215, 168) to (460, 243).
; PLAN: r0=313(x), r1=139(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=215(x1), r6=168(y1), r7=460(x2), r8=243(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 313
LDI r1, 139
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 215
LDI r6, 168
LDI r7, 460
LDI r8, 243
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT

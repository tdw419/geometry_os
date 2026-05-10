; DESCRIPTION: Draws a cyan line from (333, 197) to (168, 169).
; PLAN: r0=333(x1), r1=197(y1), r2=168(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 197
LDI r2, 168
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

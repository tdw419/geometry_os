; DESCRIPTION: Draws a cyan line from (281, 81) to (485, 27).
; PLAN: r0=281(x1), r1=81(y1), r2=485(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 81
LDI r2, 485
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan line from (413, 173) to (222, 241).
; PLAN: r0=413(x1), r1=173(y1), r2=222(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 173
LDI r2, 222
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

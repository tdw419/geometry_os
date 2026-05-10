; DESCRIPTION: Draws a red line from (398, 197) to (415, 95).
; PLAN: r0=398(x1), r1=197(y1), r2=415(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 197
LDI r2, 415
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

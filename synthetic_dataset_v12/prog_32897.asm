; DESCRIPTION: Draws a red line from (480, 32) to (340, 146).
; PLAN: r0=480(x1), r1=32(y1), r2=340(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 32
LDI r2, 340
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

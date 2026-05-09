; DESCRIPTION: Draws a cyan line from (356, 128) to (269, 107).
; PLAN: r0=356(x1), r1=128(y1), r2=269(x2), r3=107(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 128
LDI r2, 269
LDI r3, 107
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

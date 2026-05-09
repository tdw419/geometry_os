; DESCRIPTION: Places a cyan line segment connecting (46, 173) to (435, 28).
; PLAN: r0=46(x1), r1=173(y1), r2=435(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 173
LDI r2, 435
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a cyan disk with center (235, 50) and radius 54.
; PLAN: r0=235(x), r1=50(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 50
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

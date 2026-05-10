; DESCRIPTION: Places a cyan disk with center (180, 7) and radius 72.
; PLAN: r0=180(x), r1=7(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 7
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

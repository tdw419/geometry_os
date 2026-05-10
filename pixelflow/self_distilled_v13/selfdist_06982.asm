; DESCRIPTION: Places a cyan disk with center (64, 186) and radius 27.
; PLAN: r0=64(x), r1=186(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 186
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

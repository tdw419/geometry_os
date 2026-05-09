; DESCRIPTION: Places a cyan circle of radius 26 at center (353, 146).
; PLAN: r0=353(x), r1=146(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 146
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

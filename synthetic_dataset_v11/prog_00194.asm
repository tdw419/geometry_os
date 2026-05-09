; DESCRIPTION: Places a cyan circle of radius 70 at center (153, 146).
; PLAN: r0=153(x), r1=146(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 146
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

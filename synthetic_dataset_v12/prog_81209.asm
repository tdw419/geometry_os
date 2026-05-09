; DESCRIPTION: Places a cyan circle of radius 10 at center (186, 146).
; PLAN: r0=186(x), r1=146(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 146
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

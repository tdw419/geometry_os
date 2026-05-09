; DESCRIPTION: Places a cyan circle of radius 33 at center (479, 158).
; PLAN: r0=479(x), r1=158(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 479
LDI r1, 158
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Places a cyan circle of radius 50 at center (107, 166).
; PLAN: r0=107(x), r1=166(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 166
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a cyan circle centered at (295, 120) with radius 61.
; PLAN: r0=295(x), r1=120(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 120
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

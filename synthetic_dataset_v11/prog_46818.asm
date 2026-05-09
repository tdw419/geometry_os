; DESCRIPTION: Places a cyan line segment connecting (224, 93) to (239, 139).
; PLAN: r0=224(x1), r1=93(y1), r2=239(x2), r3=139(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 93
LDI r2, 239
LDI r3, 139
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

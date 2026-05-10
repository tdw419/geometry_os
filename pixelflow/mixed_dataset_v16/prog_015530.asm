; DESCRIPTION: Places a cyan line segment connecting (418, 93) to (256, 42).
; PLAN: r0=418(x1), r1=93(y1), r2=256(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 93
LDI r2, 256
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

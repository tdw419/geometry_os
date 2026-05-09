; DESCRIPTION: Places a cyan line segment connecting (128, 42) to (394, 23).
; PLAN: r0=128(x1), r1=42(y1), r2=394(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 42
LDI r2, 394
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a cyan line between points (294, 42) and (293, 175).
; PLAN: r0=294(x1), r1=42(y1), r2=293(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 42
LDI r2, 293
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

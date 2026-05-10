; DESCRIPTION: Renders a cyan box of size 24x109 starting at (331, 57).
; PLAN: r0=331(x), r1=57(y), r2=24(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 57
LDI r2, 24
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

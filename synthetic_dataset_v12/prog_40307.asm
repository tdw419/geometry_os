; DESCRIPTION: Renders a cyan box of size 83x33 starting at (44, 143).
; PLAN: r0=44(x), r1=143(y), r2=83(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 143
LDI r2, 83
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

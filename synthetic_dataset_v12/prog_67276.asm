; DESCRIPTION: Renders a cyan box of size 56x21 starting at (177, 24).
; PLAN: r0=177(x), r1=24(y), r2=56(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 24
LDI r2, 56
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

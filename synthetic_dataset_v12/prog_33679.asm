; DESCRIPTION: Renders a cyan box of size 112x90 starting at (290, 12).
; PLAN: r0=290(x), r1=12(y), r2=112(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 12
LDI r2, 112
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

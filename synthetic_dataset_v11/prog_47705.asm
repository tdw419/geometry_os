; DESCRIPTION: Renders a cyan box of size 15x60 starting at (92, 46).
; PLAN: r0=92(x), r1=46(y), r2=15(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 46
LDI r2, 15
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a cyan box of size 40x18 starting at (277, 96).
; PLAN: r0=277(x), r1=96(y), r2=40(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 96
LDI r2, 40
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

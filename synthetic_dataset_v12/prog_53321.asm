; DESCRIPTION: Renders a cyan box of size 20x30 starting at (487, 208).
; PLAN: r0=487(x), r1=208(y), r2=20(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 208
LDI r2, 20
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

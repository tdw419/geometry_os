; DESCRIPTION: Renders a cyan box of size 30x72 starting at (105, 164).
; PLAN: r0=105(x), r1=164(y), r2=30(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 164
LDI r2, 30
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

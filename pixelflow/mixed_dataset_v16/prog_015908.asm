; DESCRIPTION: Renders a cyan box of size 56x41 starting at (242, 166).
; PLAN: r0=242(x), r1=166(y), r2=56(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 166
LDI r2, 56
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

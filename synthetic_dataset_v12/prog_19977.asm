; DESCRIPTION: Renders a cyan box of size 106x41 starting at (201, 125).
; PLAN: r0=201(x), r1=125(y), r2=106(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 125
LDI r2, 106
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

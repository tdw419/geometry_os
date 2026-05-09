; DESCRIPTION: Renders a orange box of size 106x45 starting at (87, 125).
; PLAN: r0=87(x), r1=125(y), r2=106(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 125
LDI r2, 106
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

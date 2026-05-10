; DESCRIPTION: Renders a orange rectangular region spanning 16 by 110 at (107, 190).
; PLAN: r0=107(x), r1=190(y), r2=16(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 190
LDI r2, 16
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

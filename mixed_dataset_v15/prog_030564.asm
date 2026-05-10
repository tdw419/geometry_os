; DESCRIPTION: Renders a cyan rectangular region spanning 28 by 109 at (91, 187).
; PLAN: r0=91(x), r1=187(y), r2=28(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 187
LDI r2, 28
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

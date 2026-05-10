; DESCRIPTION: Renders a white rectangular region spanning 16 by 89 at (218, 146).
; PLAN: r0=218(x), r1=146(y), r2=16(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 146
LDI r2, 16
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a orange rectangle at (392, 146) with width 47 and height 83.
; PLAN: r0=392(x), r1=146(y), r2=47(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 146
LDI r2, 47
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (95, 107) with radius 71. Then Creates a cyan rectangular region at (161, 239) spanning 35 by 11 pixels.
; PLAN: r0=95(x), r1=107(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=161(x), r1=239(y), r2=35(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow circle centered at (95, 107) with radius 71.
; PLAN: r0=95(x), r1=107(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 107
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a cyan rectangular region at (161, 239) spanning 35 by 11 pixels.
; PLAN: r0=161(x), r1=239(y), r2=35(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 239
LDI r2, 35
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

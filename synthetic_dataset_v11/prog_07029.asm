; DESCRIPTION: Composite: . Then Renders a orange box of size 98x113 starting at (20, 115). Then Places a cyan line segment connecting (150, 73) to (50, 111).
; PLAN: r0=20(x), r1=115(y), r2=98(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=150(x1), r1=73(y1), r2=50(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange box of size 98x113 starting at (20, 115).
; PLAN: r0=20(x), r1=115(y), r2=98(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 115
LDI r2, 98
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan line segment connecting (150, 73) to (50, 111).
; PLAN: r0=150(x1), r1=73(y1), r2=50(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 73
LDI r2, 50
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

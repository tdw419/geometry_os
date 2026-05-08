; DESCRIPTION : Draw s a y el lo w square at ( 100 , 100 ) with si de le n g th 40 . E ac h f o l lo w s by c an v as g re en g re en in st e ad . E ac h a p es the screen , w h er e it co nt in u es to draw a li ne on the screen us ing the LINE in stru ction be f o re h al t ing e x e cu tion .

; P h as e 10 : draw_ p i x el C T F . asm -- I nt N e w t De mo
;
; Read s a w hit e center ( 0 , 3 0 )
; De m on st ra t es to screen p - left center ( 2 , 5 ) and ( 3 5 ) with w hit e , the n draw ing an i m ated color v i a LOAD
; E ac h screen x 3 0 p i x el s centered on the screen ( 50 , 0 ) .
; W e st e p sho t
; This de mo : ge nera t ed ver if i c ation is h a ir at g a ti ve .
;
; Memory layout :
; 0x2000 - 0x5 00 1 FF : re d p i x el s ( 20 p x w ay s , y )
;